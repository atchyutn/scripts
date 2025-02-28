const { DynamoDBClient } = require("@aws-sdk/client-dynamodb");
const {
  DynamoDBDocumentClient,
  ScanCommand,
} = require("@aws-sdk/lib-dynamodb");
const fs = require("fs");

// AWS Credentials (Temporary Usage)
const awsConfig = {
  region: "ap-south-1", // Replace with your actual AWS region
  credentials: {
    accessKeyId: "accessKeyId",
    secretAccessKey: "secretAccessKey",
  },
};

// Configure AWS SDK v3
const client = new DynamoDBClient(awsConfig);
const dynamoDB = DynamoDBDocumentClient.from(client);
const tableName = "your-table-name";

async function scanTable(lastEvaluatedKey = null) {
  const params = {
    TableName: tableName,
  };

  if (lastEvaluatedKey) {
    params.ExclusiveStartKey = lastEvaluatedKey; // Only add if not null
  }

  try {
    const data = await dynamoDB.send(new ScanCommand(params));
    if (!data || !data.Items) {
      console.warn("⚠️ No data retrieved from DynamoDB");
      return { Items: [], LastEvaluatedKey: null };
    }
    return data;
  } catch (error) {
    console.error("❌ Error scanning DynamoDB table:", error);
    return { Items: [], LastEvaluatedKey: null };
  }
}

async function fetchAllData() {
  let items = [];
  let lastEvaluatedKey = null;

  do {
    const data = await scanTable(lastEvaluatedKey);
    if (data.Items.length > 0) {
      items = items.concat(data.Items);
    }
    lastEvaluatedKey = data.LastEvaluatedKey || null;
  } while (lastEvaluatedKey);

  return items;
}

async function saveToFile() {
  const data = await fetchAllData();
  if (data.length === 0) {
    console.warn("⚠️ No data found to save.");
  }
  fs.writeFileSync("dynamodb_data.json", JSON.stringify(data, null, 2));
  console.log("✅ Data saved to dynamodb_data.json");
}

saveToFile();
