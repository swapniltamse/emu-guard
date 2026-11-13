# Agent image for `emu agent`: Claude Code, AWS CLI v2, Python with boto3, Node.
# Nothing from your home folder is copied or mounted in. The only AWS keys this
# container ever sees are the throwaway keys of the running emulator.
FROM node:22-bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl unzip git less python3 python3-pip \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --break-system-packages boto3

RUN arch="$(uname -m)" \
 && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${arch}.zip" -o /tmp/awscli.zip \
 && unzip -q /tmp/awscli.zip -d /tmp \
 && /tmp/aws/install \
 && rm -rf /tmp/awscli.zip /tmp/aws

RUN npm install -g @anthropic-ai/claude-code && npm cache clean --force

COPY entrypoint.sh /usr/local/bin/emu-agent-entry
RUN chmod 755 /usr/local/bin/emu-agent-entry \
 && mkdir -p /work && chown node:node /work

USER node
ENV HOME=/home/node
# Skip the first-run screens so the agent starts straight away.
RUN echo '{"hasCompletedOnboarding":true,"bypassPermissionsModeAccepted":true}' > /home/node/.claude.json

# Emulator wiring. /emu is the emulator's run folder, mounted read-only.
ENV AWS_ENDPOINT_URL=https://127.0.0.1:9297 \
    AWS_SHARED_CREDENTIALS_FILE=/emu/emulator_credentials \
    AWS_CONFIG_FILE=/emu/config \
    AWS_CA_BUNDLE=/emu/ca.pem \
    NODE_EXTRA_CA_CERTS=/emu/ca.pem \
    AWS_EC2_METADATA_DISABLED=true \
    AWS_DISABLE_HOST_PREFIX_INJECTION=true \
    AWS_REGION=us-east-1 \
    AWS_DEFAULT_REGION=us-east-1 \
    EMU_GUARD=1

WORKDIR /work
ENTRYPOINT ["emu-agent-entry"]
CMD ["claude"]
