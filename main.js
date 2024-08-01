import "./style.css";

// L'URL de l'API, assurez-vous que le serveur est démarré et écoute sur le port 11434
// variable globale
const apiUrl = "http://localhost:11434/api/chat";
const responseDiv = document.getElementById("response");
const start = document.getElementById("start");

start.addEventListener("click", function (event) {
  event.preventDefault();
  console.log("Sending:", text);
  fetchData();
});

// La requête fetch
function fetchData() {
  const requestData = {
    model: "qwen2:0.5b",
    messages: [
      {
        role: "user",
        content: document.getElementById("text").value,
      },
    ],
    stream: false,
  };

  console.log("Requesting:", requestData);
  fetch(apiUrl, {
    method: "POST", // Type de requête
    headers: {
      "Content-Type": "application/json", // Indique que le contenu est en JSON
    },
    body: JSON.stringify(requestData), // Convertit les données en chaîne JSON
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok " + response.statusText);
      }
      return response.json(); // Traite la réponse en tant que JSON
    })
    .then((data) => {
      const response = data.message.content;
      responseDiv.innerHTML = response;
    })
    .catch((error) => {
      console.error("There was a problem with the fetch operation:", error);
    });
}
