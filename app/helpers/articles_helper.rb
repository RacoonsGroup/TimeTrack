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
      content_tag :button, 'Mark as unread', class: "btn btn-danger btn-mini"
    else
      content_tag :button, 'Mark as read', class: "btn btn-success btn-mini"
    end
  end
end
