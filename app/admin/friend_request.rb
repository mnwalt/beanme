ActiveAdmin.register FriendRequest do

 permit_params :sender_id, :receiver_id, :status

 end
