FROM rakudo-star

WORKDIR /srv

ENV AUTHOR_TESTING=1

RUN echo "===> Installing system dependencies" && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libssl-dev && \
    apt-get install -y mongodb-server && \
    apt-get install -y redis-server && \
    apt-get install -y memcached && \
    echo "===> Installing: Perl6 modules" && \
    zef install \
        Test::META \
        Path::Iterator \
        TAP::Harness \
        Crypt::Random \
        # Crypt::Bcrypt \
        DBIish \
        Crust \
#        https://travis-ci.org/szabgab/galaxy/builds/265911018
#        https://github.com/tokuhirom/p6-HTTP-Server-Tiny/issues/63
        Sparrowdo \
        Cache::Memcached \
        && \
        # All the prereqs of Bailador
    #zef install \
    #    Digest \
    #    Digest::HMAC \
    #    File::Directory::Tree \
    #    File::Find \
    #    File::Temp \
    #    HTTP::Easy \
    #    HTTP::MultiPartParser \
    #    HTTP::Server::Ogre \
    #    HTTP::Status \
    #    JSON::Fast \
    #    Log::Any \
    #    Path::Iterator \
    #    Template::Mojo \
    #    Template::Mustache \
    #    Terminal::ANSIColor \
    #    URI \
    #    YAMLish \
    #    Email::Valid \
    #    LWP::Simple \
    #    IO::Socket::SSL && \
    zef install \
        Bailador \
    #    Inline::Perl5 \
    #    https://travis-ci.org/szabgab/galaxy/builds/265902800
        App::Mi6 \
        HTTP::UserAgent

#RUN git clone https://github.com/tokuhirom/p6-HTTP-Server-Tiny.git 
#RUN cd p6-HTTP-Server-Tiny && prove6 t/09-chunked-request.t
        # additional modules
        # Redis \
        # MongoDB

COPY . .

CMD ["/bin/bash"]
