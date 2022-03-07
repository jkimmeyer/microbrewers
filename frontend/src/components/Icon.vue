<script>
import { Icon, addIcon } from '@iconify/vue';

import cart24Regular from '@iconify/icons-fluent/cart-24-regular';
import add24Regular from '@iconify/icons-fluent/add-24-filled';
import subtract24Regular from '@iconify/icons-fluent/subtract-24-filled';
import delete24Regular from '@iconify/icons-fluent/delete-24-filled';
import arrowCircleRight24Regular from '@iconify/icons-fluent/arrow-circle-right-24-filled';
import questionCircle24Regular from '@iconify/icons-fluent/question-circle-24-regular';

addIcon('cart', cart24Regular);
addIcon('add', add24Regular);
addIcon('subtract', subtract24Regular);
addIcon('delete', delete24Regular);
addIcon('arrow-circle-right', arrowCircleRight24Regular);
addIcon('question-circle', questionCircle24Regular);

export default Icon;
</script>
