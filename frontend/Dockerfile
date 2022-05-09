FROM node:18.1-alpine3.15

# Set the Node environment to development to ensure all packages are installed
ENV NODE_ENV development

# instal pnpm for node-module installation
RUN apk add --no-cache curl \
    && curl -fsSL https://get.pnpm.io/v6.16.js | node - add --global pnpm
    # && curl -f https://get.pnpm.io/v7.0.js | node - add --global pnpm

# Change our current working directory
WORKDIR /usr/src/app

# Copy over `package.json` and lock files to optimize the build process
COPY [".npmrc", "package.json", "pnpm-lock.yaml", "./"]

# Install Node modules
RUN pnpm install

# Copy over rest of the project files
COPY . .

# Expose port 3000 for the SvelteKit app and 24678 for Vite's HMR
EXPOSE 3000
EXPOSE 24678

# Run `ypnpm dev` and set the host to 0.0.0.0 so we can access the web app from outside
CMD ["pnpm", "dev", "--host", "0.0.0.0"]