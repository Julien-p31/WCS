#!/bin/bash
# Le code doit :
# 1- demander sur quelle machine on se connecte
# 2- demander si on veut faire une action ou de la demande d'informations
# 3- exécuter 4 codes en fonction des choix : action1, action2, information1, information2.
# => rajouter fin du script partout

# Définition des couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # Aucune couleur

# Variables Utilisateurs
user1="lbartaire@10.0.0.20"
user2="lbartaire@10.0.0.21"

# Variables ACTION
Exe_script_User="chmod +x /tmp/UserControl.sh && /tmp/UserControl.sh && rm /tmp/UserControl.sh"
Exe_script_Group="chmod +x /tmp/GroupControl.sh && /tmp/GroupControl.sh && rm /tmp/GroupControl.sh"
Exe_script_System="chmod +x /tmp/GestionDuSysteme.sh && /tmp/GestionDuSysteme.sh && rm /tmp/GestionDuSysteme.sh"
Exe_script_Logiciel="chmod +x /tmp/GestionLogiciel.sh && /tmp/GestionLogiciel.sh && rm /tmp/GestionLogiciel.sh"
Exe_script_Parefeu="chmod +x /tmp/GestionParefeu.sh && /tmp/GestionParefeu.sh && rm /tmp/GestionParefeu.sh"
Exe_script_Repertoire="chmod +x /tmp/GestionDesRepertoires.sh && /tmp/GestionDesRepertoires.sh && rm /tmp/GestionDesRepertoires.sh"

# Variables COLLECTE INFORMATION
Exe_script_InfoUser="chmod +x /tmp/InfoUtilisateur.sh && /tmp/InfoUtilisateur.sh && rm /tmp/InfoUtilisateur.sh"
Exe_script_InfoSoftware="chmod +x /tmp/InfoDuSystemeSoftware.sh && /tmp/InfoDuSystemeSoftware.sh && rm /tmp/InfoDuSystemeSoftware.sh"
Exe_script_InfoHardware="chmod +x /tmp/InfoDuSystemeHardware.sh && /tmp/InfoDuSystemeHardware.sh && rm /tmp/InfoDuSystemeHardware.sh"


# Menu principal choix machine
while true; do
    echo -e "${GREEN} \nChoisissez la machine sur laquelle vous voulez vous connecter :\n"
    echo -e "${YELLOW}[1]${NC} Ubuntu 1"
    echo -e "${YELLOW}[2]${NC} Ubuntu 2"
    echo -e "${YELLOW}[x]${NC} Quitter\n"
    read -p "Votre choix : " machine

    case $machine in
        1)  # Menu dans Ubuntu 1 choix action ou information
            while true; do
                echo -e "${GREEN} \nMenu Ubuntu 1:\n"
                echo -e "${YELLOW}[1]${NC} Actions"
                echo -e "${YELLOW}[2]${NC} Informations"
                echo -e "${YELLOW}[3]${NC} Retour au menu principal"
                echo -e "${YELLOW}[x]${NC} Fin du script\n"
                read -p "Veuillez choisir une option: " action

                case $action in
                    1)  # Action dans Ubuntu 1
                        while true; do
                            echo -e "${GREEN} \nMenu action dans Ubuntu 1:\n"                           
                            echo -e "${YELLOW}[1]${NC} Gestion utilisateurs"
                            echo -e "${YELLOW}[2]${NC} Gestion des groupes"
                            echo -e "${YELLOW}[3]${NC} Gestion du système"
                            echo -e "${YELLOW}[4]${NC} Gestion des Répertoires"
                            echo -e "${YELLOW}[5]${NC} Prise en main CLI"
                            echo -e "${YELLOW}[6]${NC} Gestion Logiciel"
                            echo -e "${YELLOW}[7]${NC} Gestion du Parefeu"
                            echo -e "${YELLOW}[8]${NC} Retour au menu précédent"
                            echo -e "${YELLOW}[x]${NC} Fin du script\n"
                            read -p "Votre choix : " gestion

                            case $gestion in 
                                1)     #gestions des utilisateurs
                                    scp ~/script_action/UserControl.sh $user1:/tmp
                                    ssh -t $user1 "$Exe_script_User"
                                    ;;   
                                    
                                2)         #gestions groupes (code a modifier)
                                    scp ~/script_action/GroupControl.sh $user1:/tmp
                                    ssh -t $user1 "$Exe_script_Group"
                                    ;; 
                                    
                                3)          #gestions système
                                    scp ~/script_action/GestionDuSysteme.sh $user1:/tmp
                                    ssh -t $user1 "$Exe_script_System"
                                    ;; 
                                    
                                4)          #gestions Répertoires
                                    scp ~/script_action/GestionDesRepertoires.sh $user1:/tmp
                                    ssh -t $user1 "$Exe_script_Repertoire"
                                    ;; 
                                    
                                5)          #Prise en main CLI
                                    ssh -t $user1
                                    ;;
                                    
                                6)          #gestions logiciel 
                                    scp ~/script_action/GestionLogiciel.sh $user1:/tmp
                                    ssh -t $user1 "$Exe_script_Logiciel"
                                    ;;
                                7)          #gestions Parefeu
                                    scp ~/script_action/GestionParefeu.sh $user1:/tmp
                                    ssh -t $user1 "$Exe_script_Parefeu"
                                    ;;    
                                    
                                8)          #sortie  
                                    echo -e "\nRetour au menu précédent"
                                    break
                                    ;;
                                    
                                x)      #Fin du script
                                    echo -e "\n${YELLOW}Fin du script\n${NC}"
                                    exit 0
                                    ;;
                                    
                                *)      #Erreur
                                    echo -e "${RED}\n[Erreur]! Option invalide, veuillez réessayer !${NC}"
                                    ;;
                            esac
                        done
                        ;;
                        
                    2)      # Informations dans Ubuntu 1
                        while true; do
                            echo -e "${GREEN}  \nMenu Informations sur Ubuntu 1:\n"
                            echo -e "${YELLOW}[1]${NC} Informations Utilisateur"
                            echo -e "${YELLOW}[2]${NC} Informations Systeme Software"
                            echo -e "${YELLOW}[3]${NC} Informations Systeme Hardware"
                            echo -e "${YELLOW}[4]${NC} Retour au menu précédent"
                            echo -e "${YELLOW}[x]${NC} Fin du script\n"
                            read -p "Votre choix : " information

                       case $information in
                        1)    #Informations Utilisateur
                            scp ~/script_information/InfoUtilisateur.sh $user1:/tmp
                            ssh -t $user1 "$Exe_script_InfoUser"
                            ;;
                            
                        2)    #Information Systeme Software
                            scp ~/script_information/InfoDuSystemeSoftware.sh $user1:/tmp
                            ssh -t $user1 "$Exe_script_InfoSoftware"
                            ;;
                            
                        3)    #Information Système Hardware
                            scp ~/script_information/InfoDuSystemeHardware.sh $user1:/tmp
                            ssh -t $user1 "$Exe_script_InfoHardware"
                            ;; 
                            
                        4)    #sortie  
                            echo -e "\nRetour au menu précédent"
                            break
                            ;;
                            
                        x)    #Fin du script
                            echo -e "\n${YELLOW}Fin du script\n${NC}"
                            exit 0
                            ;;
                            
                        *)    #Erreur
                            echo -e "${RED}\n[Erreur]! Option invalide, veuillez réessayer !${NC}"
                            ;;
                            esac
                        done
                        ;;
                        
                    3)      # retour au Menu De Ubuntu 1
                        echo -e "\nRetour au menu principal"
                        break
                        ;;
                        
                    x)      #Fin du script
                        echo -e "\n${YELLOW}Fin du script\n${NC}"
                        exit 0
                        ;;
                        
                    *)      #Erreur
                        echo -e "${RED}\n[Erreur]! Option invalide, veuillez réessayer !${NC}"
                        ;;
                esac
            done
            ;;
            
        2)      # Menu dans Ubuntu 2
            while true; do
                echo -e "${GREEN} \nMenu Ubuntu 2:\n"
                echo -e "${YELLOW}[1]${NC} Actions"
                echo -e "${YELLOW}[2]${NC} Informations"
                echo -e "${YELLOW}[3]${NC} Retour au menu principal"
                echo -e "${YELLOW}[x]${NC} Fin du script\n"
                read -p "Choisissez une option: " action

                case $action in
                    1)      # Action dans Ubuntu 2
                        while true; do
                            echo -e "${GREEN} \nMenu action dans Ubuntu 2:\n"                        
                            echo -e "${YELLOW}[1]${NC} Gestion utilisateurs"
                            echo -e "${YELLOW}[2]${NC} Gestion des groupes"
                            echo -e "${YELLOW}[3]${NC} Gestion du système"
                            echo -e "${YELLOW}[4]${NC} Gestion des Répertoires"
                            echo -e "${YELLOW}[5]${NC} Prise en main CLI"
                            echo -e "${YELLOW}[6]${NC} Gestion Logiciel"
                            echo -e "${YELLOW}[7]${NC} Gestion du Parefeu"
                            echo -e "${YELLOW}[8]${NC} Retour au menu précédent"
                            echo -e "${YELLOW}[x]${NC} Fin du script\n"                      
                            read -p "Votre choix : " gestion

                            case $gestion in
                                1)      #gestions des utilisateurs
                                    scp ~/script_action/UserControl.sh $user2:~
                                    ssh -t $user2 "$Exe_script_User"
                                    ;; 
                                    
                                2)      #gestions des Groupes 
                                    scp ~/script_action/GroupControl.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Group"
                                    ;;   
                                    
                                3)      #gestions système
                                    scp ~/script_action/GestionDuSysteme.sh $user2:~
                                    ssh -t $user2 "$Exe_script_System"
                                    ;;     
                                    
                                4)      #gestions Répertoires
                                    scp ~/script_action/GestionDesRepertoires.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Repertoire"
                                    ;;   
                                    
                                5)      #Prise en main CLI
                                    ssh -t $user2
                                    ;;
                                    
                                6)      #gestions logiciel
                                    scp ~/script_action/GestionLogiciel.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Logiciel"
                                    ;;
                                    
                                7)      #gestions Parefeu
                                    scp ~/script_action/GestionParefeu.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Parefeu"
                                    ;;
                                    
                                8)      #Information Système
                                    scp ~/script_action/InfoDuSysteme.sh $user2:~
                                    ssh -t $user2 "$Exe_script_Systeme"
                                    ;;   
                                    
                                9)      #Retour au menu précédent
                                    echo -e "\nRetour au menu précédent"
                                    break
                                    ;;
                                    
                                x)      #Quitter
                                    echo -e "\n${YELLOW}Fin du script\n${NC}"
                                    exit 0
                                    ;;
                                    
                                *)      #Erreur
                                    echo -e "${RED}\n[Erreur]! Option invalide, veuillez réessayer !${NC}"
                                    ;;
                            esac
                        done
                        ;;
                        
                    2)      # Informations dans Ubuntu 2 
                          while true; do
                            echo -e "${GREEN}  \nMenu Informations sur Ubuntu 1:\n"
                            echo -e "${YELLOW}[1]${NC} Informations Utilisateur"
                            echo -e "${YELLOW}[2]${NC} Informations Systeme Software"
                            echo -e "${YELLOW}[3]${NC} Informations Systeme Hardware"
                            echo -e "${YELLOW}[4]${NC} Retour au menu précédent"
                            echo -e "${YELLOW}[x]${NC} Fin du script\n"
                            read -p "Votre choix : " information

                       case $information in
                        1)    #Informations Utilisateur
                            scp ~/script_information/InfoUtilisateur.sh $user1:/tmp
                            ssh -t $user2 "$Exe_script_InfoUser"
                            ;;
                            
                        2)    #Information Systeme Software
                            scp ~/script_information/InfoDuSystemeSoftware.sh $user1:/tmp
                            ssh -t $user2 "$Exe_script_InfoSoftware"
                            ;;
                            
                        3)    #Information Système Hardware
                            scp ~/script_information/InfoDuSystemeHardware.sh $user1:/tmp
                            ssh -t $user2 "$Exe_script_InfoHardware"
                            ;; 
                            
                        4)    #sortie  
                            echo -e "\nRetour au menu précédent"
                            break
                            ;;
                            
                        x)    #Fin du script
                            echo -e "\n${YELLOW}Fin du script\n${NC}"
                            exit 0
                            ;;
                            
                        *)    #Erreur
                            echo -e "${RED}\n[Erreur]! Option invalide, veuillez réessayer !${NC}"
                            ;;
                            esac
                        done
                        ;;             
                        
                    3)      # Retour au Menu Ubuntu 2
                        echo "Retour au menu principal"
                        break
                        ;;
                        
                    x)      # Fin du script
                        echo -e "\n${YELLOW}Fin du script\n${NC}"
                        exit 0
                        ;;
                        
                    *)      #Erreur
                        echo -e "${RED}[Erreur]! Option invalide, veuillez réessayer !${NC}"
                        ;;
                esac
            done
            ;;
            
        x)      #Fin du script
            echo -e "\n${YELLOW}Fin du script\n${NC}"
            exit 0
            ;;
            
        *)      #Erreur
            echo -e "${RED}\n[Erreur]! Option invalide, veuillez réessayer !${NC}"
            ;;
    esac
done
