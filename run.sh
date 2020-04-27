function join_by { local IFS="$1"; shift; echo "$*"; }

SKIP_AUX=1
SKIP_PACKAGE=0
SKIP_DOTFILES=0

while test $# -gt 0
do
    case "$1" in
        --skip-package) 
            echo "> skipping package";
            SKIP_PACKAGE=1
            echo "> skipping package";
            ;;
        --skip-dotfiles)
            echo "> skipping dotfiles";
            SKIP_DOTFILES=1
            echo "> skipping dotfiles";
            ;;
        --do-aux)
            echo "> executing aux tasks (false by default)";
            SKIP_AUX=0
            ;;
        -h|--help)
            echo -e "Valid arguments:\n  --skip-package\n  --skip-dotfiles"; exit 0;
            ;;
        --*) echo "-X bad argument: $1 ignoring..."
            ;;
        *) echo "-X bad argument: $1 ignoring..."
            ;;
    esac
    shift
done

if [ -r "$HOME/.user.password" ]; then
    echo "# User password file exists"
else
    echo -e "# User password file doesn't exists. Insert now: "
    read tmpread
    echo $tmpread > $HOME/.user.password
fi

if [ -r "$HOME/.anslap.password" ]; then
    echo "# Ansible vault password file exists"
else
    echo -e "# Ansible vault password file doesn't exists. Insert now: "
    read tmpread
    echo $tmpread > $HOME/.anslap.password
fi

if [ "$SKIP_AUX" -eq "1" ]; then SKIP_TAGS+=(aux); fi
if [ "$SKIP_DOTFILES" -eq "1" ]; then SKIP_TAGS+=(dotfiles); fi
if [ "$SKIP_PACKAGE" -eq "1" ]; then SKIP_TAGS+=(package); fi

SKIP_TAGS_JOINED=$(join_by , "${SKIP_TAGS[@]}")

ANSIBLE_FORCE_COLOR=true \
    ansible-playbook \
    -i myhost \
    site.yml \
    --vault-password-file $HOME/.anslap.password \
    -e ansible_sudo_pass=`cat $HOME/.user.password` \
    --skip-tags="${SKIP_TAGS_JOINED}" \
| sed 's/\\n/\n/g'
