build: deps
	bun run build

run: deps
	bun run dev

deps: node_modules

node_modules: ./bun.lockb
	bun install
	touch node_modules
