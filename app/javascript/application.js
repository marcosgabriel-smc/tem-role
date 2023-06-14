// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"


// CUSTOM JS FOR ZIP CODE
// O VALOR TO HTML TAG ESTÁ SENDO ALTERADO MAS NÃO CONSTA COMO INPUT DO SIMPLE FORM
document.querySelector("#cep").addEventListener("focusout", function(event) {
  let cep = event.target.value

  fetch(`https://viacep.com.br/ws/${cep}/json/`, {
    method: 'get'
  })
    .then(function (response) {
      response.json().then(function(result){
        if (result.erro) {
         alert('CEP Não Localizado');
        } else {
        console.log(result)
        document.querySelector("#rua").value = result["logradouro"]
        document.querySelector("#bairro").value = result["bairro"]
        document.querySelector("#cidade").value = result["localidade"]
        document.querySelector("#uf").value = result["uf"]
        }
      })
    })
    .catch(function(error) {
      alert('CEP Não Localizado');
    })
})
