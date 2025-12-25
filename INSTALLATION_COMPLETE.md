# Instagram MCP Server - Installation Complete

## ✅ Installation Status

- **Repository cloned:** `mcp-servers/instagram/`
- **Dependencies installed:** All requirements installed in venv
- **Environment file created:** `.env` (update with your credentials)
- **Documentation:** README.md and SETUP.md created

## 📋 Next Steps

### 1. Get Instagram API Credentials

Follow the detailed guide in [AUTHENTICATION_GUIDE.md](AUTHENTICATION_GUIDE.md) to:
- Create Facebook App
- Set up Instagram Business Account
- Generate long-lived access token
- Get Instagram Business Account ID

### 2. Configure Environment Variables

Edit `mcp-servers/instagram/.env` with your credentials:

```env
INSTAGRAM_ACCESS_TOKEN=your_long_lived_access_token
FACEBOOK_APP_ID=your_facebook_app_id
FACEBOOK_APP_SECRET=your_facebook_app_secret
INSTAGRAM_BUSINESS_ACCOUNT_ID=your_instagram_business_account_id
```

### 3. Add to MCP Configuration

#### Cursor Configuration

Add to your Cursor MCP settings (`~/.cursor/mcp.json` or Cursor settings):

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

**Note:** You can either:
- Set environment variables in the MCP config (as shown above), OR
- Use the `.env` file in the `instagram/` directory (the server will read from `.env` automatically)

#### Claude Desktop Configuration

Add to `claude_desktop_config.json` (typically `~/Library/Application Support/Claude/claude_desktop_config.json` on macOS):

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

### 4. Test the Server

After configuring credentials, restart your MCP client (Cursor/Claude Desktop) and test with:

```
Get my Instagram profile information
```

## 📚 Documentation

- **[README.md](README.md)** - Server overview and tool documentation
- **[SETUP.md](SETUP.md)** - Quick setup guide
- **[AUTHENTICATION_GUIDE.md](AUTHENTICATION_GUIDE.md)** - Complete authentication setup
- **[INSTAGRAM_DM_SETUP.md](INSTAGRAM_DM_SETUP.md)** - Direct messaging setup (Advanced Access)

## 🔧 Server Details

- **Entry Point:** `src/instagram_mcp_server.py`
- **Python Version:** 3.10+ (using venv Python 3.11)
- **Dependencies:** Installed in project venv
- **Configuration:** Environment variables via `.env` or MCP config

## ⚠️ Important Notes

1. **Credentials Security:** Never commit `.env` file to version control (already in `.gitignore`)
2. **Token Expiration:** Long-lived tokens expire after 60 days - implement refresh strategy
3. **Business Account Required:** Only works with Instagram Business accounts linked to Facebook Pages
4. **DM Features:** Direct messaging requires Advanced Access approval from Meta

## 🐛 Troubleshooting

If the server fails to start:
1. Verify all environment variables are set correctly
2. Check that Instagram Business Account is properly linked to Facebook Page
3. Ensure access token has required permissions
4. Review logs in `logs/instagram_mcp.log` (if configured)

For more troubleshooting, see the main [README.md](README.md).

