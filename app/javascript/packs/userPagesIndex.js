import mounter from "./commonMounter"
import UserPagesIndex from '../roots/UserPagesIndex.vue'

mounter(UserPagesIndex, (hook) => {
  const currentUserId = Number(hook.dataset.current_user_id)
  const userId = Number(hook.dataset.user_id)
  return {currentUserId, userId}
})
