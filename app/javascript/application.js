import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
Rails.start()
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  // 詳細表示（schedule-detail）
  document.addEventListener("click", function (e) {
    if (e.target && e.target.classList.contains("show-detail-button")) {
      const scheduleId = e.target.dataset.id;
  
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
    }
  });

  // 編集ボタン（モーダル内に後から追加される → イベントデリゲーション！）
  document.addEventListener("click", function (e) {
    if (e.target && e.target.classList.contains("edit-schedule-button")) {
      const scheduleId = e.target.dataset.id;

      fetch(`/schedules/${scheduleId}/edit`, {
        headers: {
          "Accept": "text/html"
        }
      })
        .then(response => response.text())
        .then(html => {
          const editModal = document.getElementById("edit-schedule-modal");
          editModal.innerHTML = html;
          editModal.style.display = "block";
        });
    }
  });
  document.addEventListener("click", function (e) {
    // 削除ボタンのクリック処理
    if (e.target && e.target.classList.contains("delete-schedule-button")) {
      const scheduleId = e.target.dataset.id;
      if (!confirm(e.target.dataset.confirm)) return;
  
      fetch(`/schedules/${scheduleId}`, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
          "Accept": "text/javascript"
        }
      })
        .then(response => {
          if (response.ok) {
            return response.text();
          } else {
            throw new Error("削除に失敗しました");
          }
        })
        .then(js => eval(js)) // 実行されるのは destroy.js.erb の内容
        .catch(error => alert(error));
    }
  });
});