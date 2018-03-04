module DaresHelper

  def dare_users(dare)
    message = if dare.dare_giver == current_user && dare.dare_recepient == current_user
                "<i class='text-danger'>YOU</i>YOU</i> DARED <i class='text-danger'>YOURSELF</i> !"
              elsif dare.dare_giver == current_user
                "<i class='text-danger'>YOU</i> DARED <i class='text-primary'>#{dare.dare_recepient.full_name}</i> !"
              elsif dare.dare_recepient == current_user
                "<i class='text-primary'>#{dare.dare_giver.full_name}</i> DARED <i class='text-danger'>YOU</i> !"
              else
                "<i class='text-primary'>#{dare.dare_giver.full_name}</i> DARED <i class='text-primary'>#{dare.dare_recepient.full_name}</i> !"
              end
    message.html_safe
  end

  def display_comment(comment)
    "#{comment.user.full_name}: #{comment.description}"
  end

end
