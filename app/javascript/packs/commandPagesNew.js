import mounter from "./commonMounter"
import CommandPagesNew from '../roots/CommandPagesNew.vue'

mounter(CommandPagesNew, (hook) => {
  const currentUserId = Number(hook.dataset.current_user_id)
  return {currentUserId}
})
