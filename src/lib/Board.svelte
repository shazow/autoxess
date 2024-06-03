<script lang="ts">
    import type { Piece } from "./PieceStore.svelte";

    export let board: (null | Piece)[] = Array(64).fill(null);

    export let handleDrop: (event: DragEvent) => void;

    function handleDragStart(event: DragEvent, idx: number) {
        event.dataTransfer?.setData("idx", idx.toString());
    }
</script>

<div class="board" on:drop={handleDrop} on:dragover|preventDefault>
    {#each board as piece, i}
        <div
            class="square {i % 2 === Math.floor(i / 8) % 2 ? 'dark' : 'light'}"
        >
            {#if piece}
                <div
                    class="piece {piece.team} {piece.type}"
                    draggable="true"
                    on:dragstart={(event) => handleDragStart(event, i)}
                >
                    {piece?.emoji}
                </div>
            {/if}
        </div>
    {/each}
</div>

<style>
    .board {
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        grid-template-rows: repeat(8, 1fr);
        width: 400px; /* Adjust as needed */
        height: 400px;
        border: 2px solid black;
    }

    .square {
        width: 100%;
        height: 100%;
    }

    .square.light {
        background-color: #eee;
    }

    .square.dark {
        background-color: #999;
    }
</style>
