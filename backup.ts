import { parseArgs } from "jsr:@std/cli/parse-args";
import { format } from "jsr:@std/fmt/bytes";
import { BackblazeClient } from "jsr:@nekz/b2";

const {
  _: { 0: file },
  filename: fileName,
  "user-agent": userAgent,
} = parseArgs(Deno.args);

const uploadWebhookUrl = Deno.env.get("B2_UPLOAD_DISCORD_WEBHOOK_URL")!;

const b2 = new BackblazeClient({ userAgent });

try {
  const fileContents = await Deno.readFile(file.toString());

  await b2.authorizeAccount({
    applicationKeyId: Deno.env.get("B2_APP_KEY_ID")!,
    applicationKey: Deno.env.get("B2_APP_KEY")!,
  });

  const upload = await b2.uploadFile({
    bucketId: Deno.env.get("B2_BUCKET_ID")!,
    fileName,
    fileContents,
    contentType: "text/plain",
    contentDisposition: `attachment; filename="${
      encodeURIComponent(fileName)
    }"`,
  });

  console.log(`Uploaded file ${fileName} (${upload.fileId})`);

  uploadWebhookUrl && await fetch(uploadWebhookUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "User-Agent": userAgent,
    },
    body: JSON.stringify({
      embeds: [
        {
          color: 0x0480A5,
          description: `Uploaded file \`${fileName}\` (${
            format(upload.contentLength)
          }) ${upload.contentMd5}`,
        },
      ],
    }),
  });
} catch (err) {
  console.error(err);

  uploadWebhookUrl && await fetch(uploadWebhookUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "User-Agent": userAgent,
    },
    body: JSON.stringify({
      embeds: [
        {
          color: 0xFF0000,
          description:
            `An error occurred when trying to upload file \`${fileName}\``,
        },
      ],
    }),
  });
}
