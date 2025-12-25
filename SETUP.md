# Instagram MCP Server Setup

Quick setup guide for the Instagram MCP server.

## Prerequisites

1. Instagram Business Account (linked to Facebook Page)
2. Facebook Developer Account
3. Python 3.10+

## Step 1: Install Dependencies

```bash
cd mcp-servers/instagram
pip install -r requirements.txt
```

## Step 2: Get Instagram API Credentials

See [AUTHENTICATION_GUIDE.md](AUTHENTICATION_GUIDE.md) for detailed instructions.

**Quick summary:**
1. Create Facebook App at [developers.facebook.com](https://developers.facebook.com)
2. Add Instagram Graph API product
3. Generate long-lived access token
4. Get Instagram Business Account ID

## Step 3: Configure Environment Variables

Copy the example file:

```bash
cp env.example .env
```

Edit `.env` with your credentials:

```env
INSTAGRAM_ACCESS_TOKEN=your_long_lived_access_token
FACEBOOK_APP_ID=your_facebook_app_id
FACEBOOK_APP_SECRET=your_facebook_app_secret
INSTAGRAM_BUSINESS_ACCOUNT_ID=your_instagram_business_account_id
```

## Step 4: Test Setup

Run the validation script:

```bash
python scripts/setup.py
```

## Step 5: Configure MCP Client

Add to your Cursor or Claude Desktop MCP configuration (see [README.md](README.md) for details).

## Troubleshooting

**"Invalid Access Token"**
- Check if token has expired
- Verify token has required permissions
- Regenerate long-lived token

**"Instagram account not found"**
- Verify Instagram Business Account ID is correct
- Check if Instagram account is properly linked to Facebook Page
- Ensure account is a Business account, not Personal

**"Insufficient permissions"**
- Review required permissions in Facebook App
- Re-generate access token with correct scopes
- Check if app is in Development vs Live mode

For more troubleshooting, see the main [README.md](README.md).

