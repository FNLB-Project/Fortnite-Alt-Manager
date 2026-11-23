# Builder
FROM docker.io/oven/bun:alpine@sha256:da816670775f4c2b4e990b6b1847cf5540dcdc721a42033dd331ce7a88ba6a3b AS builder
WORKDIR /bot/

ENV NODE_ENV=production

COPY . ./

RUN bun install --production --frozen-lockfile --ignore-scripts

# Runner
FROM docker.io/oven/bun:distroless@sha256:3a210956422ad81cf7532e1fc1f2eb9275d6ef4c2337a9d25d530f798e80726a AS runner
WORKDIR /bot/

ENV NODE_ENV=production

COPY --from=builder --chown=65532:65532 /bot /bot

USER 65532:65532

CMD ["src/index.ts"]
