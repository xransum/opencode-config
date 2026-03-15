---
description: Generate an image with DALL-E. Usage: /imagine [--output path] [--model dall-e-3] [--size 1024x1024] [--quality standard] [--style vivid] <prompt>
---
The user wants to generate an image using DALL-E. Their request is:

$ARGUMENTS

Run the following shell command to generate the image:

!`dalle-gen $ARGUMENTS`

After it completes, report back to the user with:
1. The full path to the saved image file (from the "saved: ..." line in the output).
2. The revised prompt if one was returned (from the "revised_prompt: ..." line), noting that DALL-E 3 may refine the original prompt for safety or quality.
3. If the command failed, show the error message and suggest fixes (e.g. missing OPENAI_API_KEY, invalid size for the chosen model, etc.).

Do not attempt to display or embed the image -- just confirm the path and any relevant details.
