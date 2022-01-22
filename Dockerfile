FROM python:latest

COPY entrypoint.sh /entrypoint.sh
COPY pyenv-versions ./

ENV LC=en_US.UTF-8

#### pyenv ####
ENV PYENV_ROOT /root/.pyenv
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
RUN curl https://pyenv.run | bash
RUN xargs -a pyenv-versions -P 3 -n 1 pyenv install \
    && xargs -a pyenv-versions pyenv global

ENTRYPOINT [ "/entrypoint.sh" ]
