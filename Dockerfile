# Builder
FROM docker.io/oven/bun:alpine@sha256:da816670775f4c2b4e990b6b1847cf5540dcdc721a42033dd331ce7a88ba6a3b
WORKDIR /bot/

COPY . ./

RUN bun install --production --frozen-lockfile --ignore-scripts

CMD ["bun", "run", "start"]
