AMMADO API FOR RUBY (AND RAILS)
===============================

Contribution
------------

Please help to make this GEM better
  + by creating a Issue and then Pull Request with a fix to this Issue.
  + support its improvement with a donation.



Ammado API reference
--------------------

https://api.ammado.com/


Configuration
-------------

First define API link:

  ```
  Ammado::Api.default_api_link = Ammado::Api.new(
    key: "AMMADO_API_KEY_HERE",
    secret: "AMMADO_API_KEY_HERE",
    host: 'https://api.ammado.com/',
    default_images_folder: '/adidas/api-internal/public/' # Endpoints where you are uploading a file, take their files from this folder.
  )
  ```

Note:

This configuration might have issues in threaded environments.
Simple fix would be defining only parameters, and when needed, creating a instance in ApiResource based on this configuration.

If issue exists see Contribution.



Implemented Endpoints and their usage
-------------------------------------


Note: you acn use parameter names both "beneficiary_id" and "beneficiaryId", but for better readibility and following Ruby standards,
I recommend under_scored, not camelCase.



### https://api.ammado.com/#FundraiserEndpoint

  ```
  ammado_fundraiser = Ammado::Fundraiser.create(
    beneficiary_id: '123',
    fundraiser_title: 'Title',
    fundraiser_description: 'Description',
    target_amount: '10.00',
    target_currency_code: 'EUR',
    thank_you_message: 'Thank you for the donation.'
  )

  if ammado_fundraiser.created?
    puts "Created a fundraiser, with permalink: #{ ammado_fundraiser.permalink }"
  else
    puts "Failed to create fundraiser and got errors #{ ammando_fundraiser.errors.map(&:message).join(', ') }"
  end

  puts "All params for fundraiser are: #{ ammado_fundraiser.params.inspect }"
  ```



### https://api.ammado.com/#FundraiserModeratorEndpoint

  ```
  fundraiser_id = ammado_fundraiser.permalink.split('/').last

  ammado_fundraiser_moderator = Ammado::FundraiserModerator.create(
    fundraiser_id: fundraiser_id,
    first_name: name,
    last_name: lastname,
    email: email
  )

  if ammado_fundraiser_moderator.created?
    puts "Created a moderator, with params: #{ ammado_fundraiser_moderator.params.inspect }"
  else
    puts "Failed to create fundraiser and got errors #{ ammando_fundraiser.errors.map(&:message).join(', ') }"
  end
  ```



### https://api.ammado.com/#FundraiserModeratorEndpoint

  ```
  fundraiser_id = ammado_fundraiser.permalink.split('/').last

  ammado_fundraiser_moderator = Ammado::FundraiserModerator.create(
    fundraiser_id: fundraiser_id,
    first_name: name,
    last_name: lastname,
    email: email
  )

  if ammado_fundraiser_moderator.created?
    puts "Created a moderator, with params: #{ ammado_fundraiser_moderator.params.inspect }"
  else
    puts "Failed to create fundraiser and got errors #{ ammando_fundraiser.errors.map(&:message).join(', ') }"
  end
  ```



### https://api.ammado.com/#FundraiserAvatarEndpoint

  ```
  fundraiser_id = ammado_fundraiser.permalink.split('/').last

  ammado_fundraiser_avatar = Ammado::FundraiserAvatar.create(
    fundraiser_id: fundraiser_id,
    file_name: 'fundraiser_avatar.png'
  )

  if ammado_fundraiser_avatar.created?
    puts "Created a moderator, with params: #{ ammado_fundraiser_avatar.params.inspect }"
  else
    puts "Failed to create fundraiser and got errors #{ ammado_fundraiser_avatar.errors.map(&:message).join(', ') }"
  end
  ```



### https://api.ammado.com/#FundraiserCoverEndpoint

  ```
  fundraiser_id = ammado_fundraiser.permalink.split('/').last

  ammado_fundraiser_cover = Ammado::FundraiserCover.create(
    fundraiser_id: fundraiser_id,
    file_name: 'fundraiser_cover.png'
  )

  if ammado_fundraiser_cover.created?
    puts "Created a moderator, with params: #{ ammado_fundraiser_cover.params.inspect }"
  else
    puts "Failed to create fundraiser and got errors #{ ammado_fundraiser_cover.errors.map(&:message).join(', ') }"
  end
  ```


  Author
  ------

  Margus Pärt (http://wave.ee)
