# TDS Project 1: Automated Web App Generator & GitHub Publisher

This project is a FastAPI-based backend that receives requests to generate web apps using OpenAI, manages attachments, and publishes the results to GitHub repositories. It supports multi-round workflows and notifies an evaluation server upon completion.

## Features

- **FastAPI REST API** for receiving app generation requests
- **OpenAI integration** for generating code and README files
- **Attachment handling** (text and binary)
- **GitHub automation**: repo creation, file commits, GitHub Pages enablement
- **Multi-round support**: revision and enhancement of previous submissions
- **Evaluation server notification** with result metadata

## Setup

1. **Clone the repository**  
   ```bash
   git clone <your-repo-url>
   cd tds-project-1-main
   ```

2. **Install dependencies**  
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure environment variables**  
   Create a `.env` file in the root directory with the following keys:
   ```
   OPENAI_API_KEY=your_openai_api_key
   GITHUB_TOKEN=your_github_token
   GITHUB_USERNAME=your_github_username
   USER_SECRET=your_secret_for_api
   ```

4. **Run the FastAPI server**  
   ```bash
   uvicorn app.main:app --host 0.0.0.0 --port 7860
   ```

## API Usage

Send a POST request to `/api-endpoint` with a JSON payload containing:

- `brief`: Project description
- `attachments`: List of attachments (optional)
- `checks`: Evaluation checks (optional)
- `task`: Unique task ID
- `email`: User email
- `round`: Round number (1 or 2)
- `nonce`: Unique nonce for request
- `evaluation_url`: Callback URL for notification
- `secret`: API secret for authentication

Example payload:
```json
{
  "brief": "Build a simple HTML calculator.",
  "attachments": [],
  "checks": ["Should support addition and subtraction"],
  "task": "calc-task-001",
  "email": "user@example.com",
  "round": 1,
  "nonce": "abc123",
  "evaluation_url": "https://evaluation.server/notify",
  "secret": "your_secret_for_api"
}
```

## Deployment on Hugging Face Spaces

1. Ensure your `Dockerfile`, `requirements.txt`, and `runtime.txt` are present.
2. Push your repository to Hugging Face Spaces.
3. The app will run on port `7860` as required by Spaces.

## License

MIT License (see `LICENSE` file for details).


