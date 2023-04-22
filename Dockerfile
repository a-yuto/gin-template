# Use the official Golang image as a base image
FROM golang:1.17-alpine as builder

# Set the working directory
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Start a new stage from scratch
FROM alpine:latest

RUN apk --no-cache add ca-certificates

# Copy the binary from the builder stage
COPY --from=builder /app/main /app/

# Copy the view templates
COPY --from=builder /app/views /app/views

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["/app/main"]
