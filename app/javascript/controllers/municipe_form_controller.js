import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["zipcode", "street", "neighborhood", "city", "uf"];
    connect() {
        console.log("ZipCode Autocomplete Controller connected");
    }

    onZipCodeChange() {
        const zipCode = event.target.value;


        if (zipCode.length === 8) {
            fetch(`https://viacep.com.br/ws/${zipCode}/json/`)
                .then(response => response.json())
                .then(data => {
                    this.streetTarget.value = data.logradouro;
                    this.neighborhoodTarget.value = data.bairro;
                    this.cityTarget.value = data.localidade;
                    this.ufTarget.value = data.uf;
                })
                .catch(error => {
                    console.error("Failed to fetch zip code data", error);
                });
        }
    }
}
