import StarRating from "./StarRating";

function SpiceItem({ spice, onUpdateSpice, onDeleteSpice }) {
  const { id, image, title, description, notes, rating } = spice;

  function handleUpdateRating(pct) {
    const newRating = pct * 5;
    fetch(`/spices/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ rating: newRating }),
    })
      .then((r) => r.json())
      .then(onUpdateSpice);
  }

  function handleDeleteSpice() {
    fetch(`/spices/${id}`, {
      method: "DELETE",
    }).then((r) => {
      if (r.ok) {
        onDeleteSpice(spice);
      }
    });
  }

  return (
    <div className="spice-item card">
      <img src={image} alt={title} />
      <div className="details">
        <h2>{title}</h2>
        <p>{description}</p>
        <p>
          Tasting Notes: <em>{notes}</em>
        </p>
        <div>
          Rating:{" "}
          <StarRating percentage={rating / 5} onClick={handleUpdateRating} />
        </div>
        <p>
          <button onClick={handleDeleteSpice}>Delete Spice</button>
        </p>
      </div>
    </div>
  );
}

export default SpiceItem;
