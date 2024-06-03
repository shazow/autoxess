<script lang="ts">
  import Board from "./Board.svelte";
  import PieceStore from "./PieceStore.svelte";
  import type { Piece } from "./PieceStore.svelte";

  import "./style.scss";

  let topPieces: PieceStore;
  let bottomPieces: PieceStore;

  function handleDrop(event: DragEvent) {
    event.preventDefault();
    const idx = event.dataTransfer?.getData("idx");
    if (!idx) throw new Error(`invalid event drop index: ${idx}`);

    let piece : Piece | null;

    const team = event.dataTransfer?.getData("team");
    if (team) {
      // Remove from team store?
      if (team === "white") {
        piece = topPieces.removePiece(Number(idx));
      } else {
        piece = bottomPieces.removePiece(Number(idx));
      }
    } else {
      // Moving within the board
      piece = board[Number(idx)];
    }

    const targetIndex = Array.from(
      (event.currentTarget as HTMLElement).children,
    ).indexOf(event.target as HTMLElement);

    if (targetIndex < 0 || targetIndex > board.length)
      throw new Error(`invalid target index: ${targetIndex}`);

    board[targetIndex] = piece;
  }

  let board: (null | Piece)[] = Array(64).fill(null);
</script>

<main>
  <div class="chess-container">
    <PieceStore team="white" bind:this={topPieces} />
    <Board bind:board {handleDrop} />
    <PieceStore team="black" bind:this={bottomPieces} />
  </div>
</main>

<style>
  .chess-container {
    display: grid;
    grid-template-columns: min-content 1fr min-content; /* Dynamic sizing */
    gap: 20px; /* Add spacing between board and stores */
    align-items: center; /* Vertically center content */
    width: fit-content; /* Container adjusts to content width */
    margin: 0 auto; /* Center the container on the page */
    padding: 20px; /* Add padding around the container */
    border: 2px solid black; /* Optional: Add a subtle border */
    background-color: #f0f0f0; /* Optional: Background for the container */
  }
</style>
