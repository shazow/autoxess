<script lang="ts">
import Autoxess from '$lib/Autoxess.svelte';
</script>

<svelte:head>
	<title>Autoxess</title>
	<meta name="description" content="Autobattler x Chess" />
</svelte:head>

<section>
	<Autoxess />
</section>

<style>
	section {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		flex: 0.6;
	}
</style>
