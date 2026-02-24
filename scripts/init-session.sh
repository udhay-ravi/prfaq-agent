#!/bin/bash
# Initialize a new PRFAQ session
# Usage: ./scripts/init-session.sh "Product Name"

set -e

if [ -z "$1" ]; then
  echo "Usage: ./scripts/init-session.sh \"Product Name\""
  echo "Example: ./scripts/init-session.sh \"CloudSync\""
  exit 1
fi

PRODUCT_NAME="$1"
SLUG=$(echo "$PRODUCT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
SESSION_DIR="output/$SLUG"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if [ -d "$SESSION_DIR" ]; then
  echo "Session already exists at $SESSION_DIR"
  echo "Use /resume to continue or delete the directory to start fresh."
  exit 1
fi

echo "Creating PRFAQ session for: $PRODUCT_NAME"
echo "Session directory: $SESSION_DIR"

mkdir -p "$SESSION_DIR"

cat > "$SESSION_DIR/session.json" << EOF
{
  "productName": "$PRODUCT_NAME",
  "description": "",
  "slug": "$SLUG",
  "createdAt": "$TIMESTAMP",
  "updatedAt": "$TIMESTAMP",
  "status": "in-progress",
  "currentDimension": 1,
  "dimensions": {
    "problem": { "status": "not-started", "data": {} },
    "evidence": { "status": "not-started", "data": {} },
    "solution": { "status": "not-started", "data": {} },
    "impact": { "status": "not-started", "data": {} },
    "roadmap": { "status": "not-started", "data": {} },
    "risks": { "status": "not-started", "data": {} }
  }
}
EOF

cp templates/prfaq-template.md "$SESSION_DIR/draft.md"
sed -i '' "s/\[Product Name\]/$PRODUCT_NAME/g" "$SESSION_DIR/draft.md" 2>/dev/null || \
sed -i "s/\[Product Name\]/$PRODUCT_NAME/g" "$SESSION_DIR/draft.md"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  PRFAQ Session Initialized"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Product: $PRODUCT_NAME"
echo "  Session: $SESSION_DIR/"
echo "  Progress: [░░░░░░░░░░░░] 0/6 dimensions"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Open this project in Claude Code and run /start to begin gathering."
