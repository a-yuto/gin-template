## ローカルで実行する

```
go run main.go
```

## デプロイ
### Google Container RegistryにPUSH

```
# Replace [PROJECT_ID] with your Google Cloud project ID
export PROJECT_ID=[PROJECT_ID]

# Build the container image
docker build -t gcr.io/$PROJECT_ID/gin-sample-app .

# Push the container image to Google Container Registry
docker push gcr.io/$PROJECT_ID/gin-sample-app
```

### Cloud Runにデプロイ
```
# Deploy the application to Cloud Run
gcloud run deploy gin-sample-app \
  --image gcr.io/$PROJECT_ID/gin-sample-app \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated

```# gin-template
