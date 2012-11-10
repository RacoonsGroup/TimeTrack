module ArticlesHelper

  def read_unread_label_for_article article
    if current_user.read? article
      content_tag :span, 'Read', class: "label label-success"
    else
      content_tag :span, 'Unread', class: "label"
    end
  end

  def importance_label_for_article article
    content_tag :span, article.importance, class: "badge importance-#{article.importance}"
  end

  def read_unread_button_for_article article
    if current_user.read? article
      html_class, label = 'danger', 'Mark as unread'
    else
      html_class, label = 'success', 'Mark as read'
    end
    content_tag :button, label,
      class: "btn btn-#{html_class} btn-mini",
      'data-id' => article.id,
      'data-url' => toggle_read_article_path(article.id)
  end
end
