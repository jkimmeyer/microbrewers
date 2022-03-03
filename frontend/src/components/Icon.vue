<script>
import { Icon, addIcon } from '@iconify/vue';

import cart24Regular from '@iconify/icons-fluent/cart-24-regular';
import add24Regular from '@iconify/icons-fluent/add-24-filled';
import subtract24Regular from '@iconify/icons-fluent/subtract-24-filled';
import delete24Regular from '@iconify/icons-fluent/delete-24-filled';

addIcon('cart', cart24Regular);
addIcon('add', add24Regular);
addIcon('subtract', subtract24Regular);
addIcon('delete', delete24Regular);

export default Icon;
</script>
