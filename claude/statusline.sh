#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size')
USAGE=$(echo "$input" | jq '.context_window.current_usage')

# Format a token count to order of magnitude (K/M) with a single decimal point
format_tokens() {
    local n=$1
    if [ "$n" -ge 1000000 ]; then
        printf '%d.%01dM' "$((n / 1000000))" "$(( (n % 1000000) / 100000 ))"
    elif [ "$n" -ge 1000 ]; then
        printf '%d.%01dK' "$((n / 1000))" "$(( (n % 1000) / 100 ))"
    else
        echo "$n"
    fi
}

if [ "$USAGE" != "null" ]; then
    # Calculate current context from current_usage fields
    CURRENT_TOKENS=$(echo "$USAGE" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    PERCENT_USED=$((CURRENT_TOKENS * 100 / CONTEXT_SIZE))
    echo "[$MODEL] Context: ${PERCENT_USED}% Tokens: $(format_tokens "$CURRENT_TOKENS")"
else
    echo "[$MODEL] Context: 0% Tokens: 0"
fi
