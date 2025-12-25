# Instagram MCP Server

MCP server for interacting with Instagram Business accounts via the Instagram Graph API.

## Features

- **Profile Management**: Get business profile information
- **Media Management**: Retrieve recent posts, get media details, publish content
- **Analytics**: Get engagement metrics and insights for posts
- **Direct Messaging**: Read and send Instagram DMs (requires Advanced Access)
- **Account Management**: List connected Facebook pages

## Prerequisites

1. **Instagram Business Account** linked to a Facebook Page
2. **Facebook Developer Account** for API access
3. **Long-lived access token** with required permissions
4. **Python 3.10+**

See [AUTHENTICATION_GUIDE.md](AUTHENTICATION_GUIDE.md) for detailed setup instructions.

## Installation

```bash
cd mcp-servers/instagram
pip install -r requirements.txt
```

## Configuration

### Environment Variables

Create a `.env` file in the `instagram/` directory:

```env
# Required
INSTAGRAM_ACCESS_TOKEN=your_long_lived_access_token
FACEBOOK_APP_ID=your_facebook_app_id
FACEBOOK_APP_SECRET=your_facebook_app_secret
INSTAGRAM_BUSINESS_ACCOUNT_ID=your_instagram_business_account_id

# Optional
INSTAGRAM_API_VERSION=v19.0
LOG_LEVEL=INFO
```

### Cursor Configuration

Add to your Cursor MCP settings:

```json
{
  "mcpServers": {
    "instagram": {
      "command": "python",
      "args": [
        "$REPO_ROOT/mcp-servers/instagram/src/instagram_mcp_server.py"
      ],
      "env": {
        "INSTAGRAM_ACCESS_TOKEN": "your_access_token",
        "FACEBOOK_APP_ID": "your_app_id",
        "FACEBOOK_APP_SECRET": "your_app_secret",
        "INSTAGRAM_BUSINESS_ACCOUNT_ID": "your_account_id"
      }
    }
  }
}
```

### Claude Desktop Configuration

Add to `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "instagram": {
      "command": "python",
      "args": [
        "$REPO_ROOT/mcp-servers/instagram/src/instagram_mcp_server.py"
      ],
      "env": {
        "INSTAGRAM_ACCESS_TOKEN": "your_access_token",
        "FACEBOOK_APP_ID": "your_app_id",
        "FACEBOOK_APP_SECRET": "your_app_secret",
        "INSTAGRAM_BUSINESS_ACCOUNT_ID": "your_account_id"
      }
    }
  }
}
```

## Available Tools

### `get_profile_info`
Get Instagram business profile information.

**Returns:**
- Profile details (username, bio, follower count, etc.)
- Account status and verification

### `get_media_posts`
Fetch recent posts from Instagram account.

**Parameters:**
- `limit` (optional): Number of posts to retrieve (default: 10, max: 50)

**Returns:**
- Array of post objects with media URLs, captions, timestamps

### `get_media_insights`
Get engagement metrics for specific posts.

**Parameters:**
- `media_id` (required): Instagram media ID
- `metrics` (optional): Specific metrics to retrieve

**Returns:**
- Engagement metrics (likes, comments, shares, reach, impressions)

### `publish_media`
Upload and publish images/videos to Instagram.

**Parameters:**
- `image_url` or `image_path` (required): Image to upload
- `caption` (required): Post caption
- `location_id` (optional): Location tag

**Returns:**
- Published media ID and status

### `get_conversations`
List Instagram DM conversations (requires Advanced Access).

**Returns:**
- Array of conversation objects

### `get_conversation_messages`
Read messages from specific conversation (requires Advanced Access).

**Parameters:**
- `conversation_id` (required): Conversation ID

**Returns:**
- Array of message objects

### `send_dm`
Send Instagram direct message (requires Advanced Access).

**Parameters:**
- `recipient_id` (required): Instagram user ID
- `message` (required): Message text

**Returns:**
- Message ID and status

## Rate Limiting

The server implements rate limiting to comply with Instagram API limits:
- Profile requests: 200 calls/hour
- Media requests: 200 calls/hour
- Publishing: 25 posts/day
- Insights: 200 calls/hour

## Error Handling

The server provides comprehensive error handling for:
- Authentication errors (invalid/expired tokens)
- Permission errors (missing required permissions)
- Rate limiting (automatic retry with backoff)
- Network errors (connection timeouts)

## Security Considerations

1. **Never commit credentials** to version control
2. **Use environment variables** or secure secret management
3. **Regularly rotate access tokens** (long-lived tokens expire after 60 days)
4. **Monitor token expiration dates**
5. **Use HTTPS only** in production

## Documentation

- **[AUTHENTICATION_GUIDE.md](AUTHENTICATION_GUIDE.md)** - Complete authentication setup guide
- **[INSTAGRAM_DM_SETUP.md](INSTAGRAM_DM_SETUP.md)** - Direct messaging setup (Advanced Access)
- **[README.md](README.md)** - Original repository README with full documentation

## Notes

- The server uses the official Instagram Graph API
- Direct messaging features require Advanced Access approval from Meta
- Long-lived tokens expire after 60 days (implement token refresh)
- The server runs in stdio mode for MCP communication
