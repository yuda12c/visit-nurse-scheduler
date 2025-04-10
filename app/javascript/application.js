// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
Rails.start()
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".show-detail-button").forEach(button => {
    button.addEventListener("click", event => {
      const scheduleId = button.dataset.id;

      fetch(`/schedules/${scheduleId}`, {
        headers: {
          "Accept": "text/html"
        }
      })
        .then(response => response.text())
        .then(html => {
          const modal = document.getElementById("schedule-detail-modal");
          modal.innerHTML = html;
          modal.style.display = "block";
        });
    });
  });
});