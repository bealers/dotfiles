# Cursor Configuration

## MCP (Model Context Protocol) Setup

This directory contains the Cursor editor configuration, specifically the MCP (Model Context Protocol) setup for integrating with external services.

### Services Configured

- **Taskmaster AI** - AI task management
- **Todoist** - Task management
- **GitHub** - Git repository management

### Setup Instructions

1. **Install the MCP servers** (if not already installed):
   ```bash
   npm install -g @abhiz123/todoist-mcp-server
   # Install other MCP servers as needed
   ```

2. **Update the configuration**:
   - Edit `~/.cursor/mcp.json` (this will be symlinked from this directory)
   - Replace the placeholder paths and API keys with your actual values
   - Update the Node.js paths to match your system

3. **Example configuration**:
   ```json
   {
     "mcpServers": {
       "todoist": {
         "command": "node",
         "args": ["/Users/bealers/.nvm/versions/node/v23.3.0/lib/node_modules/@abhiz123/todoist-mcp-server/dist/index.js"],
         "env": {
           "TODOIST_API_TOKEN": "your_actual_todoist_token"
         }
       }
     }
   }
   ```

### Security Note

- Never commit actual API keys to version control
- The template file uses placeholder values
- Update the local symlinked file with your actual keys 