import { useState, useEffect } from "react";
import Header from "./Header";
import NewSpiceForm from "./NewSpiceForm";
import SpiceItem from "./SpiceItem";

function App() {
  const [spices, setSpices] = useState([]);

  useEffect(() => {
    fetch("/spices")
      .then((r) => r.json())
      .then(setSpices);
  }, []);

  function handleAddSpice(addedSpice) {
    setSpices((spices) => [...spices, addedSpice]);
  }

  function handleUpdateSpice(updatedSpice) {
    setSpices((spices) =>
      spices.map((spice) => {
        return spice.id === updatedSpice.id ? updatedSpice : spice;
      })
    );
  }

  function handleDeleteSpice(deletedSpice) {
    setSpices((spices) =>
      spices.filter((spice) => spice.id !== deletedSpice.id)
    );
  }

  return (
    <>
      <Header spiceCount={spices.length} />
      <main>
        <NewSpiceForm onAddSpice={handleAddSpice} />
        <section className="spice-list">
          {spices.map((spice) => (
            <SpiceItem
              key={spice.id}
              spice={spice}
              onUpdateSpice={handleUpdateSpice}
              onDeleteSpice={handleDeleteSpice}
            />
          ))}
        </section>
      </main>
    </>
  );
}

export default App;
