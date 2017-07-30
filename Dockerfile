FROM rakudo-star

WORKDIR /srv

COPY . .

ENV AUTHOR_TESTING=1

RUN echo "===> Installing system dependencies" && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libssl-dev && \
    echo "===> Installing: Perl6 modules" && \
    zef install \
        Test::META \
        Path::Iterator \
        TAP::Harness \
        Crypt::Random \
        # Crypt::Bcrypt \
        DBIish && \
        # All the prereqs of Bailador
    zef install \
        Digest \
        Digest::HMAC \
        File::Directory::Tree \
        File::Find \
        File::Temp \
        HTTP::Easy \
        HTTP::MultiPartParser \
        HTTP::Server::Ogre \
        HTTP::Status \
        JSON::Fast \
        Log::Any \
        Path::Iterator \
        Template::Mojo \
        Template::Mustache \
        Terminal::ANSIColor \
        URI \
        YAMLish \
        Email::Valid \
        LWP::Simple \
        IO::Socket::SSL && \
    zef install \
        Bailador
        # additional modules
        # Redis \
        # MongoDB \

CMD ["/bin/bash"]
