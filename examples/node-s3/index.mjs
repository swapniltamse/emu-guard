// Creates a bucket and lists buckets. No endpoint or keys in the code:
// `emu run -- node index.mjs` supplies them, after the guard passes.
import { S3Client, CreateBucketCommand, ListBucketsCommand } from "@aws-sdk/client-s3";

const s3 = new S3Client({});
const bucket = `maple-orders-node-${Date.now()}`;

await s3.send(new CreateBucketCommand({ Bucket: bucket }));
const { Buckets } = await s3.send(new ListBucketsCommand({}));
console.log(`created ${bucket}`);
console.log("buckets:", Buckets.map((b) => b.Name).join(", "));
