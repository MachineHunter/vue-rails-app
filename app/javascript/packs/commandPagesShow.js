import mounter from "./commonMounter"
import CommandPagesShow from '../roots/CommandPagesShow.vue'

mounter(CommandPagesShow, (hook) => {
  const currentUserId = Number(hook.dataset.current_user_id)
  const commandId = Number(hook.dataset.command_id)
  return {currentUserId, commandId}
})
