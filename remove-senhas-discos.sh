#!/bin/bash
# Aplicar permissão para montar unidades sem senha

if [ "$(id -u)" -ne 0 ]; then
    echo "ERRO: Execute este script como root (use su - antes)"
    exit 1
fi

ARQUIVO="/usr/share/polkit-1/actions/org.freedesktop.UDisks2.policy"

# Faz backup antes de alterar
cp "$ARQUIVO" "${ARQUIVO}.backup.$(date +%Y%m%d%H%M%S)"

# Aplica a alteração apenas no bloco correto
sed -i '/org.freedesktop.udisks2.filesystem-mount-system/,/<\/action>/s/<allow_active>auth_admin_keep<\/allow_active>/<allow_active>yes<\/allow_active>/' "$ARQUIVO"

echo "Concluído! Unidades poderão ser montadas sem solicitação de senha."
echo "app feito por Leo S. Costa - B. Fundinho - Uberlândia - MG - Contato: bbp.roadrunner@gmail.com"
