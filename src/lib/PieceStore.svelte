<script lang="ts" context="module">
    export type Piece = {
        type: string;
        emoji: string;
        team: string;
    };
</script>

<script lang="ts">
    export let team = "white";
    export let pieces: Piece[] = [
        { type: "pawn", emoji: "♟️", team },
        { type: "pawn", emoji: "♟️", team },
        { type: "pawn", emoji: "♟️", team },
        { type: "rook", emoji: "♜", team },
        { type: "rook", emoji: "♜", team },
        { type: "knight", emoji: "♞", team },
        { type: "knight", emoji: "♞", team },
        { type: "bishop", emoji: "♝", team },
        { type: "bishop", emoji: "♝", team },
        { type: "queen", emoji: "♛", team },
        { type: "king", emoji: "♚", team },
    ];

    function handleDragStart(event: DragEvent, idx: number) {
        event.dataTransfer?.setData("team", team);
        event.dataTransfer?.setData("idx", idx.toString());
    }

    export function removePiece(idx: number): Piece {
        const p = pieces[idx];
        pieces = pieces.filter((_, i) => i !== idx);
        return p;
    }
</script>

<div class="piece-store">
    {#each pieces as piece, i}
        <div
            class="piece {team} {piece.type}"
            draggable="true"
            on:dragstart={(event) => handleDragStart(event, i)}
        >
            {piece.emoji}
        </div>
    {/each}
</div>

<style>
    .piece-store {
        display: flex; /* Arrange pieces in a row or column */
        flex-wrap: wrap; /* Allow pieces to wrap to the next line */
        justify-content: center; /* Center pieces horizontally */
        align-items: center; /* Center pieces vertically */
        padding: 10px; /* Add some spacing around the pieces */
        border: 2px solid black; /* Add a border to visually separate the store */
    }
</style>
