import mounter from "./commonMounter"
import CommandPagesIndex from '../roots/CommandPagesIndex.vue'

mounter(CommandPagesIndex, (hook) => {
  const currentUserId = Number(hook.dataset.current_user_id)
  return {currentUserId}
})
