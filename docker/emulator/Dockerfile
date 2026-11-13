# AWS Emulator image, from the official Docker getting-started page:
# https://docs.aws.amazon.com/emulator/latest/userguide/getting-started-docker.html
# EMU_ARCH is x86_64 or aarch64. emu picks it from `docker info`.
FROM public.ecr.aws/amazonlinux/amazonlinux:2023-minimal
ARG EMU_ARCH=x86_64
ADD https://downloads.aws.com/aws-emulator/packages/aws-emulator/LTS/latest/aws-emulator-${EMU_ARCH}.rpm /tmp/aws-emulator.rpm
RUN rpm -i /tmp/aws-emulator.rpm && rm /tmp/aws-emulator.rpm \
    && mkdir -p /home/emulator && chown 1000 /home/emulator
USER 1000
ENV HOME=/home/emulator
ENV EMULATOR_TELEMETRY=off
EXPOSE 9297
ENTRYPOINT ["aws-emulator", "-b", "0.0.0.0"]
