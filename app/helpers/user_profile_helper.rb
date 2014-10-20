module UserProfileHelper
  def follow_button is_follower
    label = is_follower ? 'Deixar de Seguir' : 'Seguir'
    link_to label, follow_user_profile_path(@user_profile), class: "btn btn-default", method: :put
  end
end