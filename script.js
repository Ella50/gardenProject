document.addEventListener("DOMContentLoaded", () => {
    const plantList = document.getElementById("plant-list");
    const plantForm = document.getElementById("plant-form");

    // Növények betöltése
    function loadPlants() {
        fetch("http://localhost:5000/plants")
            .then((res) => res.json())
            .then((data) => {
                plantList.innerHTML = "";
                data.forEach((plant) => {
                    const li = document.createElement("li");
                    li.textContent = `${plant.name} - ${plant.type}`;
                    plantList.appendChild(li);
                });
            });
    }

    // Új növény hozzáadása
    plantForm.addEventListener("submit", (event) => {
        event.preventDefault();
        const name = document.getElementById("plant-name").value;
        const type = document.getElementById("plant-type").value;

        fetch("http://localhost:5000/plants", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ name, type }),
        })
            .then((res) => res.json())
            .then(() => {
                loadPlants();
                plantForm.reset();
            });
    });

    loadPlants();
});
