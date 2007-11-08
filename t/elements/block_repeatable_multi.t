use strict;
use warnings;

use Test::More tests => 2;

use HTML::FormFu;

my $form = HTML::FormFu->new({ render_class_args => { INCLUDE_PATH => 'share/templates/tt/xhtml' } });

$form->load_config_file('t/elements/block_repeatable_inc.yml');

my $fs = $form->get_element;
my $block = $fs->get_element;

$block->repeat(1);
$block->repeat(1);

# ensure one 1 was added, total

my $elems = $block->get_elements;

ok( scalar @$elems == 1 );

is( $form, <<HTML );
<form action="" method="post">
<fieldset>
<div>
<span class="text">
<input name="foo1" type="text" />
</span>
<span class="text">
<input name="bar1" type="text" />
</span>
</div>
<span class="submit">
<input name="submit" type="submit" />
</span>
</fieldset>
</form>
HTML
