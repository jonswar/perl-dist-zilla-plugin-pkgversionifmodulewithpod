package Dist::Zilla::Plugin::PkgVersionIfModuleWithPod;
use Moose;
extends qw/ Dist::Zilla::Plugin::PkgVersion /;

around munge_perl => sub {
    my $inner = shift;
    my ( $self, $file ) = @_;

    my $content = $file->content;

    if ( $file->name =~ /\.pm/ && $content =~ /=pod/ ) {
        return $inner->(@_);
    }
};

__PACKAGE__->meta->make_immutable;

1;

__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::PkgVersionIfModuleWithPod - Apply PkgVersion to .pm files
with =pod sections

=head1 SYNOPSIS

In your L<Dist::Zilla> C<dist.ini>:

    [PkgVersionIfModuleWithPod]

=cut
