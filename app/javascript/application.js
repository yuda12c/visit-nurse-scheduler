import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
Rails.start()
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  // 詳細表示（schedule-detail）
  document.addEventListener('turbo:load', () => {
    const buttons = document.querySelectorAll('.show-detail-button');
    
    buttons.forEach((button) => {
      button.addEventListener('click', (e) => {
        e.preventDefault(); // デフォルトのリンク動作を止める
  
        const id = button.dataset.id; // データIDを取得
  
        fetch(`/schedules/${id}`)
          .then(response => response.text())
          .then(html => {
            const modal = document.getElementById('schedule-detail-modal');
            modal.innerHTML = html;
            modal.style.display = 'block'; // モーダルを表示
          })
          .catch(error => {
            console.error('エラー:', error);
          });
      });
    });
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
          const modal = document.getElementById("edit-schedule-modal");
          modal.innerHTML = html;
          modal.style.display = "block";
          modal.scrollIntoView({ behavior: "smooth" });
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