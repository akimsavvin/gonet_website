<script lang="ts">
	const links = [
		{ name: 'Docs', href: '/docs' },
		{ name: 'Blog', href: '/blog' },
		{ name: 'Showcase', href: '/showcase' },
		{ name: 'Resources', href: '/resources' }
	];
</script>

<header class="flex justify-between px-12 py-8">
	<span class="font-black text-3xl tracking-wide text-white">
		GoNet
	</span>

	<nav class="flex gap-8">
		{#each links as link}
			<a href={link.href} class="font-medium text-neutral-300">
				{link.name}
			</a>
		{/each}
	</nav>
</header>
