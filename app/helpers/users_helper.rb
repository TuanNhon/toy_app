module UsersHelper
  def gravatar_for user, size: Settings.user.gravatar_size
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    gravatar_url = Settings.user.gravatar_url % [gravatar_id: gravatar_id,
      gravatar_size: size]
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
